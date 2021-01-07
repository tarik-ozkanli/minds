module TextUtils 
( toLazyText,
  fromLazyText,
)
where
  
import Data.Text.Internal.Lazy (Text)
import Data.Text.Lazy (pack, unpack)

toLazyText :: Show a => a -> Text
toLazyText = Data.Text.Lazy.pack . show

fromLazyText :: Read a => Text -> a
fromLazyText = read . Data.Text.Lazy.unpack