module Application.Helper.View where

import IHP.ViewPrelude
import Generated.Types
import Web.Controller.Prelude

renderNavbar :: AutoRoute SessionsController => AutoRoute PostsController => Maybe (Id Post) -> Html -> Html -> Html
renderNavbar mPostId afterLogo beforeSessionBtn =
  [hsx|
    <nav class="flex items-center justify-between flex-wrap bg-gray-800 px-2 py-1">
      <div class="flex items-center py-1">
        {homeBtn}
        {afterLogo}
      </div>
      <div class="flex items-center py-1">
        {beforeSessionBtn}
        {loginLogoutButton}
      </div>
    </nav>
  |]
  where
    homeBtn :: Html
    homeBtn =
      case mPostId of
        Just postId -> [hsx|<a href={ShowPostAction postId} class="mr-2 block bg-green-500 hover:bg-green-400 text-white font-bold py-1 px-2 rounded transition duration-300">Team Retros</a>|]
        Nothing -> [hsx|<a href={PostsAction} class="mr-2 block bg-green-500 hover:bg-green-400 text-white font-bold py-1 px-2 rounded transition duration-300">Teams</a>|]

    loginLogoutButton :: Html
    loginLogoutButton =
        case fromFrozenContext @(Maybe User) of
            Just user -> [hsx|<a class="js-delete js-delete-no-confirm btn-gray ml-2" href={DeleteSessionAction}>Logout</a>|]
            Nothing -> [hsx|<a class="btn-gray ml-2" href={NewSessionAction}>Login</a>|]