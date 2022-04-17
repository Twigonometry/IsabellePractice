{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

--TODO: add second route

module SimpleAPI where

--imports for Servant datatypes

import Data.Text
import Data.Time (UTCTime)
import Servant.API

import Prelude ()
import Prelude.Compat

--imports for server

import Control.Monad.Except
import Control.Monad.Reader
import Data.Aeson
import Data.Aeson.Types
import Data.Attoparsec.ByteString
import Data.ByteString (ByteString)
import Data.List
import Data.Maybe
import Data.String.Conversions
import Data.Time.Calendar
import GHC.Generics
import Lucid
import Network.HTTP.Media ((//), (/:))
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import System.Directory
import Text.Blaze
import Text.Blaze.Html.Renderer.Utf8
import Servant.Types.SourceT (source)
import qualified Data.Aeson.Parser
import qualified Text.Blaze.Html

--define routes

type UserAPI = "users" :> QueryParam "sortby" SortUsersBy :> Get '[JSON] [User]
--            :<|> "user" :> Capture "userid" Integer :> Get '[JSON] User--TODO: add this

--define SortXBy options

data SortUsersBy = Age | Name

--define resource datatypes

data User = User {
  name :: String,
  age :: Int,
  email :: String,
  registration_date :: UTCTime
}

--define data

instance ToJSON User

users1 :: [User]
users1 =
  [ User "Isaac Newton"    372 "isaac@newton.co.uk" (fromGregorian 1683  3 1)
  , User "Albert Einstein" 136 "ae@mc2.org"         (fromGregorian 1905 12 1)
  ]

--instantiate server

server1 :: Server UserAPI1
server1 = return users1

userAPI :: Proxy UserAPI1
userAPI = Proxy

app1 :: Application
app1 = serve userAPI server1

--serve API

main :: IO ()
main = run 8081 app1