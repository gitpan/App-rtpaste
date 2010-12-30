
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'see your tickets from the command line',
  'AUTHOR' => 'FOOLISH <FOOLISH@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'App-rtpaste',
  'EXE_FILES' => [
    'bin/rtpaste',
    'bin/rtpaste'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'App::rtpaste',
  'PREREQ_PM' => {
    'App::Rad' => '0',
    'Data::Dumper' => '0',
    'Error' => '0',
    'File::Basename' => '0',
    'File::Spec::Functions' => '0',
    'RT::Client::REST' => '0'
  },
  'VERSION' => '0.0001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



