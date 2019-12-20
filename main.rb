# -*- coding: UTF-8 -*-
begin
  require 'json'
  require_relative './utils/output'
  require_relative './filters/ide_filters/vscode_filter'
  require_relative './filters/ide_filters/sublime_filter'
  require_relative './filters/ide_filters/idea_filter'
  require_relative './filters/ide_filters/pycharm_filter'
  require 'fileutils'

  # Notice: 英文 ',' 来分隔参数
  # ARGV
  params = ARGV[0]
  polishedParams = params.gsub('，', ',')

  category, *args = polishedParams.split(',')

  if args
    if args && args.size != 0
      key, argParams = args
    end
  end

  case category
  when 'code' then VscodeFilter.do_filter(key)
  when 'subl' then SublimeFilter.do_filter(key)
  when 'idea' then IdeaFilter.do_filter(key)
  when 'pcm' then PycharmFilter.do_filter(key)
  else
    item = {
      :title => 'Whoop! An unknow keyword.', 
    }
    Output.put(item)
  end
rescue Exception => e
  item = {
    :title => 'SOME ERROR HAPPENED.', 
    :subtitle => "#{e.to_s}",
    :autocomplete => "#{e.to_s}",
  }
  Output.put(item)
end