require 'rails_helper'

describe SlugHistory do
  # Tests tied to post model for now

  let!(:post) { create :post }

  describe 'self.lookup_by_slug' do
    before { post.send :save_slug!, 'now-what-I-want-is-facts' }

    it 'returns the object with the saved slug' do
      found = Post.lookup_by_slug 'now-what-I-want-is-facts'

      expect(found).to eq post
    end

    context 'with an unknown slug' do
      it 'returns nil' do
        found = Post.lookup_by_slug 'two-Households-both-alike-in-dignity'

        expect(found).to be_nil
      end
    end
  end
end
