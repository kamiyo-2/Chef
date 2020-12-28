$(function(){
  // フォームカウント
  var frm_cnt =0;
  // クローン
  $('#add_btn').on('click', function(){
    var original = $('#foodstuff_field\\[' + frm_cnt + '\\]');
    var originCnt = frm_cnt;

    frm_cnt++;

    original
      .clone()
      .appendTo(original)
      .attr('id', 'foodstuff_field[' + frm_cnt + ']')
      .end()
      .find('input, text_field').each(function(idx, obj) {
        $(obj).attr({
          id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
          name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
        });         
        $(obj).val('');
      });
    });
  });

$(function(){
  // フォームカウント
  var frm_cnt =0;
  // クローン
  $('#add_btn2').on('click', function(){
    var original = $('#step_field\\[' + frm_cnt + '\\]');
    var originCnt = frm_cnt;

    frm_cnt++;

    original
      .clone()
      .appendTo(original)
      .attr('id', 'step_field[' + frm_cnt + ']')
      .end()
      .find('input, text_field').each(function(idx, obj) {
        $(obj).attr({
          id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
          name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
        });
        $(obj).val('');
      });
    });  
});