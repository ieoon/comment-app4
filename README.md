## アプリケーション概要
- 不特定多数の人たちが匿名で気軽に質問できるアプリケーション。
  イベントや会議などの場面で効果的ではないかと考えています。トピックの製作者以外はログインする必要がないので、匿名コメントを残すことができます。
  スクリーンなどに映してリアルタイムでコメントを表示するなど様々な工夫ができるかもしれません。
  

## アプリケーションの機能一覧
- ユーザー新規登録機能
- ユーザーログイン／ログアウト機能
- マイページ表示機能
- 投稿機能
- コメント機能、いいね機能
- 投稿（編集／削除機能）

## アプリケーションで使用している技術一覧
|種別|名称|
|---|---|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.2.4.1)|
|マークアップ|HTML/CSS|
|フロントエンド|JavaScript(jQuery)|
|本番環境|AWS,EC2|
|自動デプロイ|capistrano|
|DB|MySQL|
|ユーザー管理|devise|

## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string||
|email|string|null: false|
|password|string|null: false|

### Association
- has_many : comments
- has_many : likes, dependent: :destroy

## likes テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|post_id|integer||

### Association
- belongs_to :user
- belongs_to :post

## posts テーブル

|Column|Type|Options|
|------|----|-------|
|comment_id|integer||
|text|integer||

### Association
- belongs_to :comment
- has_many :likes, dependent: :destroy
- has_many :iine_users, through: :likes, source: :user