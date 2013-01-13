require 'test/unit'
# 
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'mdpreview'
# $LOAD_PATH.unshift(File.dirname(__FILE__))
# 
#  
# 
# 各assertion的最后一个参数message表示测试失败时显示的消息
# 
# assert(boolean, message="")
# 若boolean为真则pass
# 
# assert_equal(expected, actual, message=nil)
# 若expected == actual则pass
# 
# assert_not_equal(expected, actual, message="")
# 若expected != actual则pass
# 
# assert_instance_of(klass, object, message="")
# 若klass == object.class为真则pass
# 
# assert_nil(object, message="")
# 若object.nil?则pass
# 
# assert_not_nil(object, message="")
# 若!object.nil?则pass
# 
# assert_kind_of(klass, object, message="")
# 若object.kind_of?(klass)为真则pass
# 
# assert_respond_to(object, method, message="")
# 若object.respond_to?(method)为真则pass
# 
# assert_match(pattern, string, message="")
# 若string =~ pattern为真则pass
# 
# assert_no_match(regexp, string, message="")
# 若regexp !~ string为真则pass
# 
# assert_same(expected, actual, message="")
# 若actual.equal?(expected) 为真则 pass
# 
# assert_not_same(expected, actual, message="")
# 若!actual.equal?(expected) 为真则 pass
# 
# assert_operator(object1, operator, object2, message="")
# 若object1.send(operator, object2) 为真则 pass
# 
# assert_raises(expected_exception_klass, message="") { ... }
# 执行块的内容引发异常, 若该异常属于expected_exception_klass类则pass
# 
# assert_nothing_raised(*args) { ... }
# 执行块的内容, 若没有引发异常则pass
# 
# flunk(message="")
# 通常会失败
# 
# assert_throws(expected_symbol, message="") { ... }
# 执行块的内容,若:expected_symbol被throw了,则pass
# 
# assert_nothing_thrown(message="") { ... }
# 执行块的内容, 若没有发生throw则pass
# 
# assert_in_delta(expected_float, actual_float, delta, message="")
# 若(expected_float.to_f - actual_float.to_f).abs <= delta.to_f 为真则 pass
# 
# delta必须是正数。
# 
# assert_send(send_array, message="")
# 若send_array[0].__send__(send_array[1], *send_array[2..-1])为真则 pass
# 
# assert_block(message="") { ... }
# 若block的结果为真则 pass

class MdpreviewTest < Test::Unit::TestCase
  # include Mdpreview
 
  def setup
      @friends = ['dell', 'apple', 'sony']
  end

  def teardown
  end

  def test_add
    # Mdpreview.hi "sss"
    
    
    assert_instance_of(Array, @friends, "The @friends must be Array")

    assert_equal(3, @friends.size, "The size is not 3")

    @friends << 'acer'
    assert_equal(4, @friends.size, "The size is not 4")
  end
   

end
