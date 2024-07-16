module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <p>Tango Buch</p>
      <main class="container mx-auto my-3">
         <a href={pathTo $ PostsAction} class="float-right">View your Blogs</a>
      </main>
   |]