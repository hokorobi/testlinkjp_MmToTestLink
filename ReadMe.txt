Short Manual in English and Japanese

@varion 1.1

@date 2007/11/01
@author Toshiyuki Kawanishi


---------- [[In English]] ------------------------------------------------------------------------------------------

MmToTestLink.xsl


[Introduction]
Convert mind map of FreeMind to TestLink testsuites.


[Usage]
1. Draw mind map about testcases.
   The map needs to include categories (suites) and TestLink testcase components.
   (See "ExampleTestSuite_en.mm")

2. Change the following parameter in "MmToTestLink.xsl" in order to set the level of categories' depth.
   (Default value is 2.)

   <xsl:param name='category_depth' select='2'/>

3. On the menu of FreeMind software, select [File]-[Export]-[As XSLT] and set "MmToTestLink.xsl" as xsl file.

4. Import the generated XML of test cases to TestLink.


[References]
[1] Joerg Mueller, "FreeMind - free mind mapping software", http://freemind.sourceforge.net/wiki/
[2] Tony Buzan and Barry Buzan, "The Mind Map Book", BBC Active, 2006
[3] Akira Ikeda and Mikio Suzuki, "Software testing with Mind Maps", Gijutsu-Hyohron Co., Ltd., 2007 (in Japanese)


[Change Log]
2007/11/01 version 1.1
Add parameter about the number of categories' depth.
Fix a bug.

2007/10/03 version 1.0
First release.


---------- [[In Japanese]] ------------------------------------------------------------------------------------------

MmToTestLink.xsl


[はじめに]
FreeMind形式のマインドマップをTestLink形式のテストケースに変換します。


[使用法]
1. テストケースのマインドマップを作成します。
   このマインドマップには、項目(カテゴリ)とTestLinkのテストケースの内容を含む必要があります。
   (詳しくは、"ExampleTestSuite_jp.mm"をご参照ください。)

2. "MmToTestLink.xsl"内の以下のパラメータを変更してカテゴリーの階層数を設定してください。
   (デフォルトでは 2 階層に設定されています。)

   <xsl:param name='category_depth' select='2'/>

3. FreeMindのメニューから、[File]-[Export]-[XSLTとして]を選択し、XSLファイルとして"MmToTestLink.xsl"を設定してください。

4. 生成されたテストケースのXMLをTestLinkにインポートしてください。


[参考文献]
[1] Joerg Mueller, "FreeMind - free mind mapping software", http://freemind.sourceforge.net/wiki/
[2] トニー・ブザン, バリー・ブザン, "ザ・マインドマップ", ダイヤモンド社, 2005
[3] 池田 暁, 鈴木 三紀男, "マインドマップから始めるソフトウェアテスト", 技術評論社, 2007


[更新履歴]
2007/11/01 バージョン 1.1
カテゴリーの階層を設定するためのパラメータを追加
バグを修正

2007/10/03 バージョン 1.0
新規作成
