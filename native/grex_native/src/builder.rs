use grex::RegExpBuilder;
use rustler::{NifStruct, ResourceArc};
use std::sync::RwLock;

pub struct RegExpBuilderWrapper(RwLock<RegExpBuilder>);

#[derive(NifStruct)]
#[module = "Grex.Builder"]
pub struct Builder {
    pub inner: ResourceArc<RegExpBuilderWrapper>,
}

#[rustler::nif]
pub fn builder_new(input: Vec<String>) -> rustler::NifResult<Builder> {
    if input.is_empty() {
        return Err(rustler::Error::BadArg);
    }

    Ok(Builder {
        inner: ResourceArc::new(RegExpBuilderWrapper(RwLock::new(RegExpBuilder::from(
            &input,
        )))),
    })
}

#[rustler::nif]
pub fn builder_build(input: Builder) -> String {
    let mut builder = input.inner.0.write().unwrap();
    builder.build()
}

#[rustler::nif]
pub fn builder_with_capturing_groups(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_capturing_groups();
    }

    input
}

#[rustler::nif]
pub fn builder_with_case_insensitive_matching(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_case_insensitive_matching();
    }

    input
}

#[rustler::nif]
pub fn builder_with_conversion_of_digits(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_conversion_of_digits();
    }

    input
}

#[rustler::nif]
pub fn builder_with_conversion_of_non_digits(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_conversion_of_non_digits();
    }

    input
}

#[rustler::nif]
pub fn builder_with_conversion_of_non_whitespace(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_conversion_of_non_whitespace();
    }

    input
}

#[rustler::nif]
pub fn builder_with_conversion_of_non_words(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_conversion_of_non_words();
    }

    input
}

#[rustler::nif]
pub fn builder_with_conversion_of_repetitions(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_conversion_of_repetitions();
    }

    input
}

#[rustler::nif]
pub fn builder_with_conversion_of_whitespace(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_conversion_of_whitespace();
    }

    input
}

#[rustler::nif]
pub fn builder_with_conversion_of_words(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_conversion_of_words();
    }

    input
}

#[rustler::nif]
pub fn builder_with_escaping_of_non_ascii_chars(
    input: Builder,
    use_surrogate_pairs: bool,
) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_escaping_of_non_ascii_chars(use_surrogate_pairs);
    }

    input
}

#[rustler::nif]
pub fn builder_with_minimum_repetitions(
    input: Builder,
    quantity: u32,
) -> rustler::NifResult<Builder> {
    if quantity == 0 {
        return Err(rustler::Error::BadArg);
    }

    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_minimum_repetitions(quantity);
    }

    Ok(input)
}

#[rustler::nif]
pub fn builder_with_minimum_substring_length(
    input: Builder,
    length: u32,
) -> rustler::NifResult<Builder> {
    if length == 0 {
        return Err(rustler::Error::BadArg);
    }

    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_minimum_substring_length(length);
    }

    Ok(input)
}

#[rustler::nif]
pub fn builder_with_verbose_mode(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.with_verbose_mode();
    }

    input
}

#[rustler::nif]
pub fn builder_without_anchors(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.without_anchors();
    }

    input
}

#[rustler::nif]
pub fn builder_without_end_anchor(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.without_end_anchor();
    }

    input
}

#[rustler::nif]
pub fn builder_without_start_anchor(input: Builder) -> Builder {
    {
        let mut builder = input.inner.0.write().unwrap();
        builder.without_start_anchor();
    }

    input
}

pub fn load(env: rustler::Env, _: rustler::Term) -> bool {
    rustler::resource!(RegExpBuilderWrapper, env);
    true
}
