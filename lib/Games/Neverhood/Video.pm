use 5.01;
use strict;
use warnings;
package Games::Neverhood::Video;

use File::Spec;
use Carp;
use Games::Neverhood qw/$ShareDir/;

use XSLoader;
XSLoader::load('Games::Neverhood::Video');

use overload
	'%{}' => sub { $_[0]->hash },
	'fallback' => 1,
;

sub new {
	my $class = shift;
	$class = ref $class || $class;
	my $hash = bless {@_}, $class;
	my $self;
	
	warn $hash->dir;
	warn $hash->dir;
	
	my ($dir, $file) = ($hash->dir, $hash->file);
	
	defined $file or Carp::confess("Video '", $hash->name, "' must specify a file");
	defined $dir  or Carp::confess("Video '", $hash->name, "' must specify a dir");
	
	my $filename = File::Spec->catfile($ShareDir, $dir, $file . '.0A');
	
	# $self = bless $class->xs_new($filename, {%$hash});warn $self->{file};
	
	# return $self;
	return $hash;
}

# These are called with a blessed $hash instead of the full object
# You also can't change a video's filename without creating a new one
sub dir {
	if(@_ > 1) { $_[0]->{dir} = $_[1]; return $_[0]; }
	$_[0]->{dir} ||= 't';
}
sub file {
	if(@_ > 1) { $_[0]->{file} = $_[1]; return $_[0]; }
	$_[0]->{file};
}
sub name {
	if(@_ > 1) { $_[0]->{name} = $_[1]; return $_[0]; }
	$_[0]->{name} ||= 'video';
}

sub pos {
	if(@_ > 1) { $_[0]->{pos} = $_[1]; return $_[0]; }
	$_[0]->{pos} ||= [0, 0];
}

sub normal_size {
	if(@_ > 1) { $_[0]->{normal_size} = $_[1]; return $_[0]; }
	$_[0]->{normal_size};
}

use constant {
	sequence => undef,
};

1;
