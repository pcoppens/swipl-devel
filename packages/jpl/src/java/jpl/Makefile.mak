################################################################
# Build jpl.jar
################################################################

.SUFFIXES: .java .class

JAVAC=$(JAVA_HOME)\bin\javac
JAR=$(JAVA_HOME)\bin\jar
JPL=..\..\..\jpl.jar

CLS=	Atom.class \
	Compound.class \
	Float.class \
	Integer.class \
	JBoolean.class \
	JPLException.class \
	JPL.class \
	JRef.class \
	JVoid.class \
	PrologException.class \
	Query.class \
	Term.class \
	Util.class \
	Variable.class \
	Version.class

FLI=	fli\atom_t.class \
	fli\BooleanHolder.class \
	fli\DoubleHolder.class \
	fli\engine_t.class \
	fli\fid_t.class \
	fli\functor_t.class \
	fli\IntHolder.class \
	fli\LongHolder.class \
	fli\module_t.class \
	fli\ObjectHolder.class \
	fli\PointerHolder.class \
	fli\predicate_t.class \
	fli\Prolog.class \
	fli\qid_t.class \
	fli\StringHolder.class \
	fli\term_t.class

CLASSES=$(CLS) $(FLI)

all:	$(JPL)

$(JPL):	$(CLASSES)
	$(JAR) cf $(JPL) $(CLASSES)

.java.class:
	$(JAVAC) $*.java

clean::
	if exist *.class del *.class
	if exist *~ del *~

distclean:	clean
	if exist $(JPL) del $(JPL)
