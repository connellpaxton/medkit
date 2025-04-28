#pragma once
#include <stdint.h>
#include <stddef.h>
#include "common.hpp"

namespace medkit {

/**
 * @brief limited to 2^(sizeof(size_type) characters
 * allows lookups to be faster because length is a heuristic */
template<typename size_type>
struct StringTable {
	size_t n_entries;
	uint8_t* lengths;
	uint8_t* strs;

	/** @breif
	 * 0   sizeof(size_type)  * 2  +    n_entries +    sum(lengths)
	 * [total_length][n_entries][lengths.....][entries.....]
	 */
	uint8_t* data(size_t& total_size) {
		total_size = 0;
		for(size_t i = 0; i < n_entries; i++) {
			total_size += lengths[i];
		}

		/* account for the total_length of section (so it can be skipped),
		 * size of the lengths and content arrays, as well as a total_size for the number of entries */
		total_size *= 2;
		total_size += 2 * sizeof(size_type);
		uint8_t* ret = new uint8_t[total_size];

		auto* types = reinterpret_cast<size_type*>(ret);
		types[0] = lengths;

		return ret;
	}
};


template <typename size_type>
struct ConfigurationProfileRequest {
	/* format is hard to easily encode in a C++ compile-time
	 * way as it relies upon FAMs (easily indexable) */
	Role role : 8;
	using string_table = StringTable<size_type>;
	string_table available_feature_list;
	string_table required_feature_list;
	string_table parameter_list;

	/* flattens the data */
	uint8_t* data(size_t& total_size) {
		size_type avail_size;
		available_feature_list.data(&avail_size);

		size_type req_size;
		required_feature_list.data(&req_size);

		size_type param_size;
		parameter_list.data(&param_size);
		total_size = avail_size, param_size;
		uint8_t* ret = new uint8_t[total_size];
		return ret;
	}
};

}
