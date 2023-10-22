use grex::RegExpBuilder;

pub mod builder;

#[rustler::nif]
fn new_from_list(input: Vec<String>) -> String {
    RegExpBuilder::from(&input).build()
}

rustler::init!(
    "Elixir.Grex.Native",
    [
        new_from_list,
        builder::builder_new,
        builder::builder_build,
        builder::builder_with_capturing_groups,
        builder::builder_with_case_insensitive_matching,
        builder::builder_with_conversion_of_digits,
        builder::builder_with_conversion_of_non_digits,
        builder::builder_with_conversion_of_non_whitespace,
        builder::builder_with_conversion_of_non_words,
        builder::builder_with_conversion_of_repetitions,
        builder::builder_with_conversion_of_whitespace,
        builder::builder_with_conversion_of_words,
        builder::builder_with_escaping_of_non_ascii_chars,
        builder::builder_with_minimum_repetitions,
        builder::builder_with_minimum_substring_length,
        builder::builder_with_verbose_mode,
        builder::builder_without_anchors,
        builder::builder_without_end_anchor,
        builder::builder_without_start_anchor,
    ],
    load = builder::load
);
