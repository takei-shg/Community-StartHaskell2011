｛第｝｛だい｝9｛章｝｛しょう｝：｛補足｝｛ほそく｝
===================================================

getCh
-----

GHCの｛標準｝｛ひょうじゅん｝ライブラリーには`getCh`が
｛含｝｛ふく｝まれていません。｛次｝｛つぎ｝のファイルに｛定義｝｛ていぎ｝
されています。

http://www.cs.nott.ac.uk/~gmh/calculator.lhs

もし｛自分｝｛じぶん｝で｛記述｝｛きじゅつ｝する｛場合｝｛ばあい｝
（｛学習｝｛がくしゅう｝のためにもお｛勧｝｛すす｝めします）、｛次｝｛つぎ｝の
｛定義｝｛ていぎ｝です。

    -- base
    import System.IO (hSetEcho, stdin)

    getCh :: IO Char
    getCh = do hSetEcho stdin False
               c <- getChar
               hSetEcho stdin True
               return c

9.5｛節｝｛せつ｝｛以降｝｛いこう｝のコードを｛入力｝｛にゅうりょく｝して
｛実行｝｛じっこう｝できます。`getLine`と`putStr`、`putStrLn`は`Prelude`に
｛定義｝｛ていぎ｝されているので、`Prelude`の｛定義｝｛ていぎ｝を
｛隠｝｛かく｝す｛必要｝｛ひつよう｝があります：

    import Prelude hiding (getLine, putStr, putStrLn)

wait
----

プログラムで｛時間｝｛じかん｝を｛待｝｛ま｝たせるのに、ビジーウェイトは
｛悪｝｛わる｝い｛方法｝｛ほうほう｝です。この｛章｝｛しょう｝で
｛書｝｛か｝いてある`wait 500`は｛最近｝｛さいきん｝のパソコンではほとんど
｛効果｝｛こうか｝がありません。｛代｝｛か｝わりに`Control.Concurrent`で
｛定義｝｛ていぎ｝されている`threadDelay`｛関数｝｛かんすう｝を
｛使｝｛つか｝ってください。`threadDelay 200000`とすれば｛十分｝｛じゅうぶん｝
｛時間｝｛じかん｝を｛待｝｛ま｝たせられます。

｛練習｝｛れんしゅう｝｛問題｝｛もんだい｝1
-------------------------------------------

`\ESC[1D`という｛制御｝｛せいぎょ｝｛文字列｝｛もじれつ｝はどのターミナルでも
｛動｝｛うご｝きません。しかし｛動｝｛いご｝かなくても、`getLine`の
｛戻｝｛もど｝り｛値｝｛ち｝に｛消去｝｛しょうきょ｝された｛文字｝｛もじ｝が
｛含｝｛ふく｝まれていないことを｛確認｝｛かくにん｝してください。
