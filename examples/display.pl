use Lego::Ldraw;
use Lego::Ldraw::Display;
use OpenGL qw/ :all /;

$, = " "; $\ = "\n";

my $l = Lego::Ldraw->new_from_file($ARGV[0]);
print $l->dir;

$d = Lego::Ldraw::Display->new(300, 400, $l);

$d->bindspec(GLUT_KEY_UP,        GLUT_ACTIVE_SHIFT, sub { shift->move_camera('s', 'p', -12) });
$d->bindspec(GLUT_KEY_DOWN,      GLUT_ACTIVE_SHIFT, sub { shift->move_camera('s', 'p', +12) });
$d->bindspec(GLUT_KEY_LEFT,      GLUT_ACTIVE_SHIFT, sub { shift->move_camera('s', 't', -12) });
$d->bindspec(GLUT_KEY_RIGHT,     GLUT_ACTIVE_SHIFT, sub { shift->move_camera('s', 't', +12) });
$d->bindspec(GLUT_KEY_PAGE_UP,   GLUT_ACTIVE_SHIFT, sub { shift->move_camera('s', 'r', +12) });
$d->bindspec(GLUT_KEY_PAGE_DOWN, GLUT_ACTIVE_SHIFT, sub { shift->move_camera('s', 'r', -12) });

$d->bindspec(GLUT_KEY_UP,        sub { shift->move_camera('x', 'y', -12) });
$d->bindspec(GLUT_KEY_DOWN,      sub { shift->move_camera('x', 'y', +12) });
$d->bindspec(GLUT_KEY_LEFT,      sub { shift->move_camera('x', 'x', -12) });
$d->bindspec(GLUT_KEY_RIGHT,     sub { shift->move_camera('x', 'x', +12) });
$d->bindspec(GLUT_KEY_PAGE_UP,   sub { shift->move_camera('x', 'z', +12) });
$d->bindspec(GLUT_KEY_PAGE_DOWN, sub { shift->move_camera('x', 'z', -12) });

$d->bindspec(GLUT_KEY_INSERT,    sub { print @{ shift->{camera} } });
$d->bindspec(GLUT_KEY_INSERT,    GLUT_ACTIVE_SHIFT, sub { print @{ shift->{lookat} } });

$d->init;
