class Associations < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :username
  		t.date :date_of_birth
  		t.timestamps null: false
  	end

    create_table :discussions do |t|
    	t.string :last_name
    	t.string :description
    	t.timestamps null: false
    	t.belongs_to :topics, index: true
    end

    create_table :topics do |t|
    	t.string :name
    	t.string :description
    	t.timestamps null: false
    end

    create_table :posts do |t|
    	t.belongs_to :discussion, index: true
    	t.belongs_to :user, index: true
    	t.string :title
    	t.string :text
    	t.timestamps null: false
    end
  end
end
