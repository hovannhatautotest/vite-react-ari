from jproperties import Properties

class DataTest:
    @staticmethod
    def data(datakey):
        p = Properties()
        with open("data.properties", "rb") as f:
            p.load(f, "utf-8")
        return p.get(datakey).data


# print(DataTest.data("validation"))