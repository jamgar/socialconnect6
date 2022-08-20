class UploadValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.send(attribute).attached?

    accepted_types = ["image/png", "image/jpeg"]
    unless accepted_types.include?(record.send(attribute).content_type)
      record.errors.add(:image, "Incorrect file type. Must be a JPEG or PNG")
    end

    unless record.send(attribute).byte_size <= 1.megabyte
      record.errors.add(:image, "image size is to large (Max 1MB)")
    end
  end
  
end