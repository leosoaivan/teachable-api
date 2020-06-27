class ChangeSubjectToTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :gradebooks, :subject, :title
  end
end
