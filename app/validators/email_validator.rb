
require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    begin
      m = Mail::Address.new(value)
      r = m.domain && m.address == value
      t = m.__send__(:tree)
      r &&= (t.domain.dot_atom_text.elements.size > 1) && (m.domain == "onyx-international.com")
    rescue Exception => e   
      r = false
    end
    record.errors[attribute] << (options[:message] || "该系统为内部系统，请使用公司邮箱注册！") unless r
  end
end