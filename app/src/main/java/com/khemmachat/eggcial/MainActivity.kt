package com.khemmachat.eggcial

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter
import androidx.viewpager2.widget.ViewPager2
import com.khemmachat.eggcial.page.HomeFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : FragmentActivity() {
    private val pagerAdapter: MainPagerAdapter by lazy {
        MainPagerAdapter(this)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        pager.adapter = pagerAdapter
        pager.isUserInputEnabled = false
        pager.registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {
            override fun onPageSelected(position: Int) {
                super.onPageSelected(position)

                when (position) {
                    0 -> bottom_nav.selectedItemId = R.id.home
                    1 -> bottom_nav.selectedItemId = R.id.message
                    2 -> bottom_nav.selectedItemId = R.id.profile
                }
            }
        })

        bottom_nav.setOnNavigationItemSelectedListener { item ->
            when (item.itemId) {
                R.id.home -> pager.setCurrentItem(0, false)
                R.id.message -> pager.setCurrentItem(1, false)
                R.id.profile -> pager.setCurrentItem(2, false)
            }
            true
        }
    }

    inner class MainPagerAdapter(fragmentActivity: FragmentActivity) : FragmentStateAdapter(fragmentActivity) {
        override fun getItemCount(): Int {
            return 3
        }

        override fun createFragment(position: Int): Fragment {
            return HomeFragment.newInstance()
        }
    }
}