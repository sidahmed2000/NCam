// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __java_io_ObjectInputStream$GetField__
#define __java_io_ObjectInputStream$GetField__

#pragma interface

#include <java/lang/Object.h>

class java::io::ObjectInputStream$GetField : public ::java::lang::Object
{
public:
  virtual ::java::io::ObjectStreamClass *getObjectStreamClass () = 0;
  virtual jboolean defaulted (::java::lang::String *) = 0;
  virtual jboolean get (::java::lang::String *, jboolean) = 0;
  virtual jchar get (::java::lang::String *, jchar) = 0;
  virtual jbyte get (::java::lang::String *, jbyte) = 0;
  virtual jshort get (::java::lang::String *, jshort) = 0;
  virtual jint get (::java::lang::String *, jint) = 0;
  virtual jlong get (::java::lang::String *, jlong) = 0;
  virtual jfloat get (::java::lang::String *, jfloat) = 0;
  virtual jdouble get (::java::lang::String *, jdouble) = 0;
  virtual ::java::lang::Object *get (::java::lang::String *, ::java::lang::Object *) = 0;
  ObjectInputStream$GetField ();

  friend class java_io_ObjectInputStream$GetField;

  static ::java::lang::Class class$;
};

#endif /* __java_io_ObjectInputStream$GetField__ */