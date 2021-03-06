｛補足｝｛ほそく｝｛演習｝｛えんしゅう｝｛問題｝｛もんだい｝：｛第｝｛だい｝7｛章｝｛しょう｝
=============================================================================================

「プログラミングHaskell」の｛第｝｛だい｝7｛章｝｛しょう｝のための
｛補足｝｛ほそく｝｛演習｝｛えんしゅう｝｛問題｝｛もんだい｝です。
｛本｝｛ほん｝にある｛演習｝｛えんしゅう｝｛問題｝｛もんだい｝
（ページ87、88）を｛最初｝｛さいしょ｝に｛解決｝｛かいけつ｝してください。

｛問題｝｛もんだい｝10
----------------------

｛下｝｛した｝の｛関数｝｛かんすう｝をリスト｛内包｝｛ないほう｝
｛表記｝｛ひょうき｝の｛代｝｛か｝わりに`filter`と`map`を｛使｝｛つか｝う
｛関数｝｛かんすう｝に｛書｝｛か｝き｛直｝｛なお｝せ。

    import Data.Char (isAsciiUpper, ord, toUpper)

    hoge :: String -> [Int]
    hoge xs = [ord x' + c | x <- xs, let x' = toUpper x, isAsciiUpper x']
      where
          c = 1 - ord 'A'

｛以下｝｛いか｝の｛実行例｝｛じっこうれい｝で｛自分｝｛じぶん｝の
｛定義｝｛ていぎ｝が｛正｝｛ただ｝しいことを｛確認｝｛かくにん｝せよ。

    > hoge "Haskell!"
    [8,1,19,11,5,12,12]

｛問題｝｛もんだい｝11
----------------------

クレジット・カードのチェックサムをLuhnアルゴリズムで｛確認｝｛かくにん｝する
｛関数｝｛かんすう｝`luhncheck :: String -> Bool`を｛定義｝｛ていぎ｝せよ。
｛数字｝｛すうじ｝｛以外｝｛いがい｝の｛文字｝｛もじ｝を｛無視｝｛むし｝して、
すべての｛書｝｛か｝き｛方｝｛かた｝を｛許｝｛ゆる｝せ。`Data.Char`に
｛定義｝｛ていぎ｝している`digitToInt`と`isDigit`を｛使｝｛つか｝うと
｛良｝｛よ｝い。

http://ja.wikipedia.org/wiki/Luhnアルゴリズム

｛以下｝｛いか｝の｛実行例｝｛じっこうれい｝で｛自分｝｛じぶん｝の
｛定義｝｛ていぎ｝が｛正｝｛ただ｝しいことを｛確認｝｛かくにん｝せよ。

    > luhncheck "1234-5678-9012-3452"
    True
    > luhncheck "4417123456789113"
    True
    > luhncheck "4408 0412 3456 7890"
    False

｛問題｝｛もんだい｝12
----------------------

リストのリストを｛取｝｛と｝って、｛要素｝｛ようそ｝のリストを
｛連結｝｛れんけつ｝する｛関数｝｛かんすう｝`concat :: [[a]] -> [a]`は
｛第｝｛だい｝6｛章｝｛しょう｝の｛演習｝｛えんしゅう｝｛問題｝｛もんだい｝で
｛定義｝｛ていぎ｝した。これを`foldr`を｛使｝｛つか｝って｛実装｝｛じっそう｝
した｛関数｝｛かんすう｝`concatR`を｛定義｝｛ていぎ｝せよ。さらに、`foldl`を
｛使｝｛つか｝って｛実装｝｛じっそう｝した｛関数｝｛かんすう｝`concatL`を
｛定義｝｛ていぎ｝せよ。

｛以下｝｛いか｝の｛実行例｝｛じっこうれい｝で｛自分｝｛じぶん｝の
｛定義｝｛ていぎ｝が｛正｝｛ただ｝しいことを｛確認｝｛かくにん｝せよ。

    > concatR [[1,2],[3],[],[4,5]]
    [1,2,3,4,5]
    > concatL [[1,2],[3],[],[4,5]]
    [1,2,3,4,5]
    > concatR []
    []
    > concatL []
    []

どちらが｛良｝｛よ｝いと｛思｝｛おも｝うか？これは｛何故｝｛なぜ｝か？

｛問題｝｛もんだい｝13
----------------------

｛第｝｛だい｝6｛章｝｛しょう｝で｛二｝｛ふた｝つの｛整列｝｛せいれつ｝された
リストを｛一｝｛ひと｝つの｛整列｝｛せいれつ｝されたリストにする
｛関数｝｛かんすう｝`merge`を｛定義｝｛ていぎ｝した。
｛任意｝｛にんい｝の｛数｝｛すう｝の｛整列｝｛せいれつ｝されたリストを
｛一｝｛ひと｝つの｛整列｝｛せいれつ｝されたリストにする｛関数｝｛かんすう｝
`nmerge`を｛定義｝｛ていぎ｝せよ。

｛以下｝｛いか｝の｛実行例｝｛じっこうれい｝で｛自分｝｛じぶん｝の
｛定義｝｛ていぎ｝が｛正｝｛ただ｝しいことを｛確認｝｛かくにん｝せよ。

    > nmerge [[9],[2,5,7],[1,4],[],[3,6],[8]]
    [1,2,3,4,5,6,7,8,9]

｛問題｝｛もんだい｝14
----------------------

`foldr`または`foldl`を｛使｝｛つか｝って、リストの｛中｝｛なか｝から
｛与｝｛あた｝えられた｛条件｝｛じょうけん｝を｛満｝｛み｝たす
｛要素｝｛ようそ｝の｛数｝｛かず｝を｛返｝｛かえ｝す｛関数｝｛かんすう｝
`count :: (a -> Bool) -> [a] -> Int`を｛定義｝｛ていぎ｝せよ。

｛以下｝｛いか｝の｛実行例｝｛じっこうれい｝で｛自分｝｛じぶん｝の
｛定義｝｛ていぎ｝が｛正｝｛ただ｝しいことを｛確認｝｛かくにん｝せよ。

    > count (== 1) [1,2,1,3,4,1,5,1]
    4
    > count (\x -> x `mod` 2 == 0) [1,2,1,3,4,1,5,1]
    2
    > count id [True,False,True,True]
    3
