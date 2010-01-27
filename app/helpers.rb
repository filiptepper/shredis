module Shredis
  module Helpers

    def time_distance(time)
      case time

      when 1..59
        "#{time} second#{s time}"

      when 60..3599
        minutes = (time / 60).floor
        seconds = time % 60
        "#{minutes} minute#{s minutes}" +
          (seconds > 0 ? " #{seconds} second#{s seconds}" : "")

      when 3600..86399
        hours = (time / 3600).floor
        minutes = ((time % 3600) / 60).floor
        seconds = time % 60
        "#{hours} hour#{s hours}" +
          (minutes > 0 ? " #{minutes} minute#{s minutes}" : "") +
          (seconds > 0 ? " #{seconds} second#{s seconds}" : "")

      when 86400..1.0/0
        days = (time / 86400).floor
        hours = ((time % 86400) / 3600).floor
        minutes = ((time % 3600) / 60).floor
        seconds = time % 60
        "#{days} day#{s days}" +
          (hours > 0 ? " #{hours} hour#{s hours}" : "") +
          (minutes > 0 ? " #{minutes} minute#{s minutes}" : "") +
          (seconds > 0 ? " #{seconds} second#{s seconds}" : "")

      end

    end

    def file_size(size)
      case size

      when (1024...1024 ** 2)
        "#{format("%.2f", (size / 1024.to_f))} KB"

      when (1024 ** 2...1024 ** 3)
        "#{format("%.2f", (size / 1024 ** 2.to_f))} MB"

      when (1024 ** 3...1.0/0)
        "#{format("%.2f", (size / 1024 ** 3.to_f))} GB"

      end
    end


    private


    def s(number)
      number == 1 ? "" : "s"
    end

  end
end