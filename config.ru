require './config/environment'

use Rack::MethodOverride
use UserController
use CharacterController
run ApplicationController
