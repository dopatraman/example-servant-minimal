{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App2 where

import Servant
import System.IO
import Network.Wai.Handler.Warp

import Api
import Models

author1 :: User
author1 = User "Prakash Venkatraman" "prakash@carbonfive.com"

posts :: [BlogPost]
posts = [
        BlogPost "Demo title" author1 "This is some content\nHuzzah!",
        BlogPost "New Post" author1 "More content"
        ]

server :: Server PostAPI
server = return posts

app :: Application
app = serve postAPI server

run :: Int -> IO ()
run port = do
    let settings = setPort port $
            setBeforeMainLoop (hPutStrLn stderr ("listening on port " ++ show port)) $
            defaultSettings
    runSettings settings =<< (return app :: IO Application)
