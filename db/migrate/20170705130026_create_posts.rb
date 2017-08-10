class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      #(User/상세내용(설명)/월세가격/보증금가격/대략적 위치(북문 정문 등)/기간/사진/연락처(폰)/카톡아이디/오픈카톡url )
      t.string :title #글제목
      t.integer :user_id #User
      t.string :content #상세내용 (설명)
      t.integer :monthly_rental_fee #월세 가격
      t.integer :deposit #보증금 가격
      t.string :location #대략적 위치
      t.string :period #남은 기간
      t.string :photos #사진
      t.string :phone_number #연락처1
      t.string :kakao_id #카카오아이디
      t.string :open_chat_url #오픈 채팅 url
      

      t.timestamps null: false
    end
  end
end
