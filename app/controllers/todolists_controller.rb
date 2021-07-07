class TodolistsController < ApplicationController
  def new
     # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
     @list = List.new
  end
  def create
    #1.データを新規登録するためのインスタンス作成
    list = List.new(list_params) #下記のprivateタグから情報を取得
    #2.データをデータベースへ保存するメソッド実行
    list.save
    #3.トップ画面へリダイレクト
    redirect_to '/top'
  end
  
  #ここから下の処理はコードの最終段で記述する。処理をこの場のみで行いたい場合にprivateタグにいれる。
  private #このタグはcontorollerの中でしか処理を呼び出すことができない(外部から操作することができない)
  #ストロングパラメーター(セキュリティ上の脆弱性を防ぐもの)
  def list_params #paramsとはRailsから出力されたデータを受け取る
    params.require(:list).permit(:title, :body) 
    #requireとはオブジェクト名を指定(ここでは:listを指定)
    #permitはHTMLで入力された(:title)(:body)を指定している。
    #上記の処理をcreateのlistに出力
    
  end
end
