module HammerCLIForemanOpenscap
  module Options
    module Normalizers
      class ScapFile < HammerCLI::Options::Normalizers::File
        attr_reader :original_filename

        def format(path)
          @original_filename = path.split('/').last
          super path
        end
      end

      class BinaryFile < HammerCLI::Options::Normalizers::File
        def format(path)
          ::File.new(::File.expand_path(path), 'rb')
        end
      end
    end
  end
end
