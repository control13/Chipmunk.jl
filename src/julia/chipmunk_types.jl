struct Space
    ptr::Ptr{Void}
end

struct Body
    ptr::Ptr{Void}
end

struct Arbiter
    ptr::Ptr{Void}
end

abstract type Shape end
struct CircleShape <: Shape
    ptr::Ptr{Void}
end

struct SegmentShape <: Shape
    ptr::Ptr{Void}
end

struct PolyShape <: Shape
    ptr::Ptr{Void}
end

abstract type Constraint end
struct SimpleMotor <: Constraint
    ptr::Ptr{Void}
end

struct PivotJoint <: Constraint
    ptr::Ptr{Void}
end

struct PinJoint <: Constraint
    ptr::Ptr{Void}
end

struct GearJoint <: Constraint
    ptr::Ptr{Void}
end

struct SlideJoint <: Constraint
    ptr::Ptr{Void}
end

struct DampedSpring <: Constraint
    ptr::Ptr{Void}
end

struct CollisionHandler
    ptr::Ptr{Void}
end

struct BB
    l::Cdouble
    b::Cdouble
    r::Cdouble
    t::Cdouble
end

struct Vect
    x::Cdouble
    y::Cdouble
end

struct Transform
    a::Cdouble
    b::Cdouble
    c::Cdouble
    d::Cdouble
    tx::Cdouble
    ty::Cdouble
end

struct Mat2x2
    a::Cdouble
    b::Cdouble
    c::Cdouble
    d::Cdouble
end

export Vect, Body, Space, Shape, CircleShape, SegmentShape,
PolyShape, Transform, Mat2x2, BB, CollisionHandler, Constraint,
SimpleMotor, PivotJoint, PinJoint, GearJoint, SlideJoint,
DampedSpring
