{-# LANGUAGE DeriveGeneric #-}

module Models where

import Data.Aeson
import GHC.Generics

data User = User {
    name :: String,
    email :: String
} deriving (Show, Generic)
instance ToJSON User

data BlogPost = BlogPost {
    title :: String,
    author :: User,
    content :: String
} deriving (Show, Generic)
instance ToJSON BlogPost
