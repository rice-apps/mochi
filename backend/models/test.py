from peewee import *
import random

pg_db = PostgresqlDatabase(
    'mochi', user='postgres', password='postgres', port=5432)


class BaseModel(Model):
    class Meta:
        database = pg_db


class Student(BaseModel):
    name = CharField(max_length=100, unique=True)


class Course(BaseModel):
    name = CharField(max_length=100, unique=True)


class StudentCourse(BaseModel):
    student = ForeignKeyField(Student)
    course = ForeignKeyField(Course)


def populate():
    pg_db.create_tables([Student, Course, StudentCourse], safe=True)

    students = ["student1", "student2", "student3", "student4"]
    courses = ["python", "java", "DataStructures",
               "WebDevelopment", "OperatingSystems"]

    for cour in courses:
        Course.create_or_get(name=cour)

    for stud in students:
        s = Student.create(name=stud)
        Course.create_or_get(name=random.choice(courses))

        indexes = set()
        while len(indexes) < 2:
            indexes.add(random.randint(0, len(courses) - 1))

        indexes = list(indexes)
        course1 = Course.get(name=courses[indexes[0]])
        course2 = Course.get(name=courses[indexes[1]])

        StudentCourse.create(student=s, course=course1)
        StudentCourse.create(student=s, course=course2)

    print("done\n")


if __name__ == "__main__":

    # populate()

    # get all student for a particular course
    query = (Student
             .select()
             .join(StudentCourse)
             .join(Course)
             .where(Course.name == 'DataStructures'))

    for student in query:
        print(student.name)
    print()

    # get all courses a student took
    student_courses = (Course
                       .select()
                       .join(StudentCourse)
                       .join(Student)
                       .where(Student.name == 'student1'))

    for course in student_courses:
        print(course.name)
