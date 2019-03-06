{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Api where

import Servant
import Models

type PostAPI = "posts" :> Get '[JSON] [BlogPost]

postAPI :: Proxy PostAPI
postAPI = Proxy
