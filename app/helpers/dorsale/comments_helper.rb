module Dorsale::CommentsHelper
  def comments_for(commentable)
    comments    = policy_scope(::Dorsale::Comment).where(commentable: commentable)
    new_comment = new_comment_for(commentable)

    render(
      :partial => "dorsale/comments/comments",
      :locals  => {
        :comments    => comments,
        :new_comment => new_comment,
      },
    )
  end

  def new_comment_for(commentable)
    policy_scope(Dorsale::Comment).new(commentable: commentable, author: current_user)
  end

  def truncate_comments_in_this_page?
    params[:controller].include?("customer_vault")
  end

  def truncate_comment_text(comment)
    text      = comment.text.to_s
    truncated = false

    if text.to_s.count("\n") > 3
      text      = text.split("\n")[0, 3].join("\n")
      truncated = true
    end

    if text.to_s.length > 300
      text      = truncate(text, length: 200)
      truncated = true
    end

    text2html(text) if truncated
  end
end
