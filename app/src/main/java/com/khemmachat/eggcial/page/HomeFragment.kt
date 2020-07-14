package com.khemmachat.eggcial.page

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.khemmachat.eggcial.R
import kotlinx.android.synthetic.main.fragment_home.view.*

class HomeFragment : Fragment() {
    private val layoutManager by lazy {
        LinearLayoutManager(context)
    }

    private val feedAdapter by  lazy {
        FeedAdapter()
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_home, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        view.recycler.layoutManager = layoutManager
        view.recycler.adapter = feedAdapter

        mockData()
    }

    private fun mockData() {
        feedAdapter.items = listOf(
            R.layout.post_message_item,
            R.layout.post_photo_item,
            R.layout.post_message_item,
            R.layout.post_message_item,
            R.layout.post_photo_item,
            R.layout.post_photo_item
        )
        feedAdapter.notifyDataSetChanged()
    }

    companion object {
        fun newInstance() =
            HomeFragment()
    }

    inner class FeedAdapter(var items: List<Int> = listOf()) : RecyclerView.Adapter<RecyclerView.ViewHolder> () {
        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
            val view = LayoutInflater.from(parent.context).inflate(viewType, parent, false)
            return PostViewHolder(view)
        }

        override fun getItemViewType(position: Int): Int {
            return items[position]
        }

        override fun getItemCount(): Int {
            return items.count()
        }

        override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {}

        inner class PostViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)
    }
}