require './config/environment'

use Rack::MethodOverride
use UserController
use CharacterController
use GameController
run ApplicationController
