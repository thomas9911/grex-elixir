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
fn new_from_list(input: Vec<String>) -> String {
    RegExpBuilder::from(&input).build()
}

#[rustler::nif]
fn new_builder(input: Vec<String>) -> Builder {
    Builder{
        inner: ResourceArc::new(RegExpBuilderWrapper(RwLock::new(RegExpBuilder::from(&input))))
    }
}

#[rustler::nif]
fn builder_build(input: Builder) -> String {
    let mut builder = input.inner.0.write().unwrap();
    builder.build()
}

rustler::init!("Elixir.Grex.Native", [new_from_list, new_builder, builder_build], load = load);

fn load(env: rustler::Env, _: rustler::Term) -> bool {
    rustler::resource!(RegExpBuilderWrapper, env);
    true
}
