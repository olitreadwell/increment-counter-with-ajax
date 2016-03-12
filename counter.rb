configure :development, :test do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

class Counter
  include DataMapper::Resource
  property :id, Serial
  property :value, Integer

  def ensure_not_nil
    if self.value.nil?
      self.update({value: 0})
    end
  end
end

DataMapper.finalize
