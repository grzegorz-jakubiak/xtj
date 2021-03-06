# typed: true
# frozen_string_literal: true

module XTJ
  module Tags
    class XMLTag
      extend T::Sig
      attr_reader :tag, :attributes

      sig { params(tag: Symbol, attributes: Hash).void }
      def initialize(tag:, attributes:)
        @tag = tag
        @attributes = attributes
      end

      sig { params(tag: Symbol, attributes: Hash).void }
      def add_to_attributes(tag, attributes)
        if @attributes[tag].nil?
          @attributes[tag] = attributes
        elsif @attributes[tag].is_a?(Array)
          @attributes[tag] << attributes
        else
          same_tags = [@attributes[tag]]
          @attributes[tag] = same_tags << attributes
        end
      end
    end
  end
end
