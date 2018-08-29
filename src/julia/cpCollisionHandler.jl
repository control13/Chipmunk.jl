function rbegin_func(arbiter_ptr::Ptr{Cvoid}, space_ptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    data = unsafe_pointer_to_objref(data)
    begin_func = data[1][1]
    userdata = data[2]
    arbiter = Arbiter(arbiter_ptr)
    space = Space(space_ptr)

    begin_func(arbiter, space, userdata)
end
function rpresolve_func(arbiter_ptr::Ptr{Cvoid}, space_ptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    data = unsafe_pointer_to_objref(data)
    presolve_func = data[1][2]
    userdata = data[2]
    arbiter = Arbiter(arbiter_ptr)
    space = Space(space_ptr)

    presolve_func(arbiter, space, userdata)
end
function rpostsolve_func(arbiter_ptr::Ptr{Cvoid}, space_ptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    data = unsafe_pointer_to_objref(data)
    postsolve_func = data[1][3]
    userdata = data[2]
    arbiter = Arbiter(arbiter_ptr)
    space = Space(space_ptr)

    postsolve_func(arbiter, space, userdata)
    return nothing
end
function rseparate_func(arbiter_ptr::Ptr{Cvoid}, space_ptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    data = unsafe_pointer_to_objref(data)
    separate_func = data[1][4]
    userdata = data[2]
    arbiter = Arbiter(arbiter_ptr)
    space = Space(space_ptr)

    separate_func(arbiter, space, userdata)
    return nothing
end

# function CollisionHandler(typeA::Integer, typeB::Integer, begin_func::Function, presolve_func::Function,
#                           postsolve_func::Function, separate_func::Function, userdata::Array{Any})

#     callbacks = [begin_func, presolve_func, postsolve_func, separate_func]
#     real_data = pointer_from_objref([callbacks, userdata])
#     c_begin = @cfunction($rbegin_func, Bool, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
#     c_presolve = @cfunction($rpresolve_func, Bool, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
#     c_postsolve = @cfunction($rpostsolve_func, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
#     c_separate = @cfunction($rseparate_func, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
#     ccall(Libdl.dlsym(libchipmunkjl, :cpCollisionHandler_create), Ptr{Cvoid},
#          (UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}),
#           typeA, typeB, c_begin, c_presolve, c_postsolve, c_separate, real_data)
# end

function cpSetCollisionHandler(space::Space, typeA::Integer, typeB::Integer, begin_func::Union{Function, Cvoid}, presolve_func::Union{Function, Cvoid}, postsolve_func::Union{Function, Cvoid}, separate_func::Union{Function, Cvoid}, user_data::Any)
    c_begin = typeof(begin_func) <: Function ? @cfunction($begin_func, Bool, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid})) : C_NULL
    c_presolve =  typeof(presolve_func) <: Function ? @cfunction($presolve_func, Bool, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid})) : C_NULL
    c_postsolve =  typeof(postsolve_func) <: Function ? @cfunction($postsolve_func, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid})) : C_NULL
    c_separate =  typeof(separate_func) <: Function ? @cfunction($separate_func, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid})) : C_NULL
    c_usrdata =  user_data != nothing ? pointer_from_objref(user_data) : C_NULL
    ccall(Libdl.dlsym(libchipmunkjl, :cpjlSetCollisionHandler), Ptr{Cvoid}, (Ptr{Cvoid}, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), space.ptr, typeA, typeB, c_begin, c_presolve, c_postsolve, c_separate, c_usrdata)
end
