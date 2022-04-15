# and factory iOS 課題アプリ

 <img src="https://user-images.githubusercontent.com/58368688/163523476-1b1a6c6c-a5b8-424c-beb4-857e7686c5dc.png" width="30%" />
 <img src="https://user-images.githubusercontent.com/58368688/163523526-2cd4105c-6dd0-4e36-a828-3ba67e57abe0.png" width="30%" />

## 必須機能
- 検索/結果表示画面
  - ユーザ表示機能
  - 検索機能
  - ユーザ選択
- ユーザ情報表示画面
  - ユーザ情報表示
  - 戻るボタン
  
## 追加機能
- エラーハンドリング
- 0件のときの表示
- テスト
- CI

## アーキテクチャ
- MVP

## ライブラリ管理
- CocoaPods

## 使用ライブラリ
### ネットワーク通信
- [Alamofire](https://github.com/Alamofire/Alamofire)<br>
選定理由：定番かつstars数や更新頻度などを考慮して選択しました。
 
### 画像ライブラリ
- [Nuke](https://github.com/kean/Nuke)<br>
選定理由：今回はどの画像ライブラリを使用してもあまり違いが無いと考えたため、以下の記事を参考に最も表示スピードが速いものを選択しました。
https://qiita.com/hcrane/items/422811dfc18ae919f8a4

### 静的解析ツール
- [SwiftLint](https://github.com/realm/SwiftLint)<br>
選定理由：実務プロジェクトを想定してコーディングスタイル統一のため、静的解析ツールを導入しました。

### ライセンス生成
- [LicensePlist](https://github.com/mono0926/LicensePlist)<br>
選定理由：ライセンス表記を自動で行ってくれるため、導入しました。

## CIツール
- Bitrise

## API
- [GitHub Search API](https://docs.github.com/ja/rest/reference/search#search-users)

## 工夫した点
実務プロジェクトを想定して以下の導入を行いました。
- GitHub flowに沿ったブランチ運用
- SwiftLintによるコーディングスタイルの統一化
- Bitriseを用いた自動テスト

## 環境構築手順
```
# リポジトリをローカルにコピー
git@github.com:Luigi-jp/andfactory-iOS-kadai.git 

# 移動
cd ./andfactory-iOS-kadai  

# ライブラリインストール
pod install
```
