module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)
import IHP.LoginSupport.Middleware
import Web.Controller.Sessions

-- Controller Imports
import Web.Controller.Users
import Web.Controller.Comments
import Web.Controller.Posts
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @UsersController
        , parseRoute @CommentsController
        , parseRoute @PostsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        -- Get the current time.
        currentTime <- getCurrentTime
        -- Pass it to the default layout.
        setLayout (defaultLayout currentTime)
        initAutoRefresh
        initAuthentication @User
