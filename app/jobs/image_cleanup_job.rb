class ImageCleanupJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find_by(id: post_id)

    if post.present? && post.created_at < Time.find_zone('Asia/Tokyo').now - 5.minutes
      # 画像のクリーンアップ処理を行う
      post.destroy 
    end
  end
end