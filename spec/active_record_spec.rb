require 'spec_helper'
require 'active_record.rb'
require './test/muffin_blog/app/models/application_record.rb'
require './test/muffin_blog/app/models/post.rb'

RSpec.describe ActiveRecord do

  before do
    Post.establish_connection(
      database: "/Users/kathpobee-norris/KPN/mini-rails/test/muffin_blog/db/development.sqlite3")
  end

  describe '#intialize'do
    it 'will initialize' do
      post = Post.new(id: 1, title: 'My first post')
      expect(post.id).to eq 1
      expect(post.title).to eq 'My first post'
    end
  end

  describe '#find' do
    it 'will find a record' do
      post = Post.find(1)
      expect(post).to be_a_kind_of(Post)
      expect(post.id).to eq 1
      expect(post.title).to eq 'Blueberry Muffins'
    end
  end

  it 'will connect to the database' do
    rows = Post.connection.execute("SELECT * FROM posts")
    rows = rows.first
    expect(rows).to be_a_kind_of(Hash)
    expect(rows.keys).to eq [:id, :title, :body, :created_at, :updated_at]
  end
end
