class AddCommentToChild < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :comment, :string
  end
end
