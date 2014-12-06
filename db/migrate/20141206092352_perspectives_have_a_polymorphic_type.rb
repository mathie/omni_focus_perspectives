class PerspectivesHaveAPolymorphicType < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.uuid :perspective_detail_id
      t.string :perspective_detail_type
    end

    add_index :perspectives, [ :perspective_detail_id, :perspective_detail_type ], name: 'index_perspectives_on_detail_id_and_type'
  end
end
