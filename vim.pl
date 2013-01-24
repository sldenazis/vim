#!/usr/bin/perl

##  @Author: Santiago López Denazis
##    @Date: 2013/01/22
## @Version: 0.1

use strict;
use Switch;
use POSIX qw/strftime/;

sub parse_args {
	## Devuelve los parámetros de vim y los ficheros por separado
	## Si los ficheros son nuevos, se devuelven dentro de $vim_args
	my @parametros = @_;
	my $vim_args;
	my @files_to_edit;
	my $file_index = 0;
	my $aux_option;
	
	while (@parametros) {
		$aux_option = @parametros[0];
		if ( -f $aux_option ) {
			@files_to_edit[$file_index] = $aux_option;
			$file_index = $file_index + 1;
		} else {
			if ( "$aux_option" ne "-S" ) {
				if ( "$vim_args" eq "" ) {
					$vim_args = $aux_option;
				} else {
					$vim_args = "$vim_args $aux_option";
				}
			} else {
				shift(@parametros);
				if ( "$vim_args" eq "" ) {
					$vim_args = $aux_option;
				} else {
					$vim_args = "$vim_args $aux_option";
				}
				$vim_args = "$vim_args @parametros[0]";
			}
		}
		shift(@parametros);
	}

	return $vim_args, @files_to_edit;
}

sub md5_check_file {
	## Devuelve md5sum del fichero pasado como parámetro
	use Digest::MD5;
	my $check_file = shift;
	
	open(CHECK_FILE, $check_file) or die("No se pudo calcular la suma md5 del fichero $check_file");
	my $md5_file = Digest::MD5->new;
	$md5_file->addfile(*CHECK_FILE);
	my $hex_md5_file = $md5_file->hexdigest;
	close(*CHECK_FILE);

	return $hex_md5_file;
}

sub get_file_properties {
	## Devuelve array con nombre, path y extensión del fichero pasado como parámetro
	use File::Basename;
	my $file_to_edit = shift;
	my @exts = (".txt", ".sh", ".php", ".html", ".pl", ".py");
	my @file_properties;
	my($name,$path,$suffix) = fileparse($file_to_edit,@exts);

	@file_properties = ($name, $path, $suffix);
	
	return @file_properties;
}

sub backup_file {
	## Devuelve nombre absoluto del fichero de backup
	use File::Path qw/make_path/;
	use File::Copy;
	my $file_to_bkp = shift;

	# Usuario que se logueó, como $(logname)
	my $user_login = getlogin;
	# Usuario que ejecuta, como $(whoami)
	my $user_run = getpwuid($>);

	my $fecha_hoy = strftime "%Y%m%d", localtime;
	my $hora_modificacion = strftime "%H%M%S", localtime;
	
	my @file_properties = get_file_properties($file_to_bkp);

	my $backup_dir = "/vim/$user_run/$fecha_hoy";
	my $backup_file = "$backup_dir/$file_properties[0]$file_properties[2].$user_login.$hora_modificacion";

	# Si no existe el directorio se crea
	if ( -d $backup_dir ) {
		copy($file_to_bkp, $backup_file);
	} else {
		# Uso make_path() en lugar de mkdir() ya que make_path puede crear una estructura
		# completa de directorios (como el mkdir -p de bash)
		make_path($backup_dir);
	}

	return $backup_file;
}

sub comment_file {
	my $file_to_commit = shift;
}

sub run_vim {
	my $vim_binary = "/usr/bin/vim";
	my $vim_args = shift;
	my @files_to_edit = @_;
	my $file_index = 0;
	my @backup_files;
	my $backup_index = 0;
	my $file_to_backup;

	foreach $file_to_backup (@files_to_edit) {
		@backup_files[$backup_index] = backup_file($file_to_backup);
		$backup_index = $backup_index + 1;
	}

	system("$vim_binary $vim_args @files_to_edit");

	foreach $file_to_backup (@backup_files) {
		if ( md5_check_file($file_to_backup) ne md5_check_file(@files_to_edit[$file_index]) ) {
			print "Se ha modificado el fichero!\n";
			## Llamar a funcion de comentarios!
		} else {
			unlink($file_to_backup);
		}
		$file_index = $file_index + 1;
	}

	return 0;
}


my @script_args = @ARGV;
my($vim_args, @files_to_edit) = parse_args(@script_args);

run_vim($vim_args, @files_to_edit);
