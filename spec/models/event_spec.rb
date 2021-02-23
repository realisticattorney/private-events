require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'title presence' do
    it 'if title present' do
      e = Event.new
      e.title = 'pass'
      e.valid?
      expect(e.errors[:title]).not_to include("can't be blank")
    end
    it 'if title not present' do
      e = Event.new
      e.title = ''
      e.valid?
      expect(e.errors[:title]).to include("can't be blank")
    end
  end
  describe 'description presence' do
    it 'if description present' do
      e = Event.new
      e.description = 'pass'
      e.valid?
      expect(e.errors[:description]).not_to include("can't be blank")
    end
    it 'if description not present' do
      e = Event.new
      e.description = ''
      e.valid?
      expect(e.errors[:description]).to include("can't be blank")
    end
  end
  describe 'date presence' do
    it 'if date present' do
      e = Event.new
      e.date = DateTime.now
      e.valid?
      expect(e.errors[:date]).not_to include("can't be blank")
    end
    it 'if date not present' do
      e = Event.new
      e.date = ''
      e.valid?
      expect(e.errors[:date]).to include("can't be blank")
    end
    it 'if date present but wrong format' do
      u = Event.new
      u.date = 'asdf'
      u.valid?
      expect(u.errors[:date]).to include("can't be blank")
    end
  end

  describe 'all presence' do
    it 'if host_id not present' do
      expect do
        Event.create!(title: 'event', description: 'description',
                      date: '2020-11-22 18:42:00')
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Host must exist')
    end

    it 'if all present' do
      User.create!(username: 'test1', email: 'fan1@example.com', password: 'password1')
      expect(Event.create!(title: 'event', description: 'description', date: '2020-11-22 18:42:00',
                           host_id: User.find(1).id).valid?).to be true
    end
  end
end
