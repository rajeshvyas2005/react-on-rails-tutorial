package main

import "fmt"

type item struct {
	index string
	w     int
	v     float32
}

var wants = []item{
	{"Map", 57247, 0.0887},
	{"Banana", 98732, 0.1856},
	{"Water", 134928, 0.2307},
	{"Apple", 77275, 0.1522},
	{"Compass", 29240, 0.0532},
	{"Cheese", 15440, 0.0250},
	{"Sandwitch", 70820, 0.1409},
	{"Beer", 139603, 0.2541},
	{"Glucose", 63718, 0.1147},
	{"Suntan", 143807, 0.2660},
	{"Tin", 190457, 0.2933},
	{"Camera", 40572, 0.0686},
}

const maxWt = 500000

func main() {
	items, w, v := m(len(wants)-1, maxWt)
	fmt.Println(items)
	fmt.Println("weight:", w)
	fmt.Println("value:", v)
}

func m(i int, w int) ([]string, int, float32) {
	if i < 0 || w == 0 {
		return nil, 0, 0
	} else if wants[i].w > w {
		return m(i-1, w)
	}
	i0, w0, v0 := m(i-1, w)
	i1, w1, v1 := m(i-1, w-wants[i].w)
	v1 += wants[i].v
	if v1 > v0 {
		return append(i1, wants[i].index), w1 + wants[i].w, v1
	}

	return i0, w0, v0
}
