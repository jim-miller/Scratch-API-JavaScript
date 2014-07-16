guard 'coffeescript', output: 'public/javascripts', all_on_start: true do
  watch(%r{^src/coffeescripts/(.+\.coffee)$})
  watch(%r{^lib/coffeescripts/(.+\.coffee)$})
  watch(%r{^spec/coffeescripts/(.+\.coffee)$})
end

guard 'livereload' do
  watch(%r{^spec/javascripts/.+\.js})
  watch(%r{^public/javascripts/.+\.js})
end

guard :jasmine, :port => 8888, :timeout => 30, :coverage => true do
  watch(%r{spec/javascripts/spec\.(js\.coffee|js|coffee)$}) { 'spec/javascripts' }
  watch(%r{spec/javascripts/.+_spec\.(js\.coffee|js|coffee)$})
  watch(%r{spec/javascripts/fixtures/.+$})
  watch(%r{public/javascripts/(.+?)\.(js\.coffee|js|coffee)(?:\.\w+)*$}) { |m| "spec/javascripts/#{ m[1] }_spec.#{ m[2] }" }
end

guard :bundler do
  watch('Gemfile')
end
