require './config/environment'

use Rack::MethodOverride
use Rack::Flash
use UserController
use CharacterController
use GameController
run ApplicationController
