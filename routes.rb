get '/' do
  @counter = Counter.first_or_create
  @counter.ensure_not_nil
  erb :home
end

put '/increment_counter' do
  counter = Counter.first
  counter.update({value: counter.value + 1})
  redirect to("/")
end

put '/increment_counter_ajax' do
  counter = Counter.first
  counter.update({value: counter.value + 1})
  counter.value

  content_type 'application/json'
  { :counter_value => counter.value}.to_json
end
